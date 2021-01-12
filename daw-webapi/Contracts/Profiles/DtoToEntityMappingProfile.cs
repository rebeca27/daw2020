using AutoMapper;
using daw_webapi.Contracts.Dtos;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts
{
    public class DtoToEntityMappingProfile : Profile
    {
        public DtoToEntityMappingProfile()
        {
            CreateMap<PersonDto, Person>();
            CreateMap<Person, PersonDto>()
                .ForMember(x => x.Email, y => y.MapFrom(z => z.User != null ? z.User.Email : string.Empty));

            CreateMap<LocationDto, Location>();
            CreateMap<Location, LocationDto>();

            CreateMap<EventParentDto, EventParent>();
            CreateMap<EventParent, EventParentDto>()
                .ForMember(x => x.EventGenreName, y => y.MapFrom(z => z.EventGenre != null ? z.EventGenre.Name : string.Empty))
                .ForMember(x => x.EventTypeName, y => y.MapFrom(z => z.EventType != null ? z.EventType.Name : string.Empty));

            CreateMap<EventTypeDto, EventType>();
            CreateMap<EventType, EventTypeDto>();

            CreateMap<EventGenreDto, EventGenre>();
            CreateMap<EventGenre, EventGenreDto>();

            CreateMap<EventTypeXEventGenreDto, EventTypeXEventGenre>();
            CreateMap<EventTypeXEventGenre, EventTypeXEventGenreDto>()
                .ForMember(x => x.EventGenreName, y => y.MapFrom(z => z.EventGenre != null ? z.EventGenre.Name : string.Empty))
                .ForMember(x => x.EventTypeName, y => y.MapFrom(z => z.EventType != null ? z.EventType.Name : string.Empty));

            CreateMap<TicketDto, Ticket>();
            CreateMap<Ticket, TicketDto>()
                .ForMember(x => x.TicketTypeName, y => y.MapFrom(z => z.TicketType != null ? z.TicketType.Name : string.Empty));

            CreateMap<TicketTypeDto, TicketType>();
            CreateMap<TicketType, TicketTypeDto>();

            CreateMap<PersonXTicketDto, PersonXTicket>();
            CreateMap<PersonXTicket, PersonXTicketDto>()
                .ForMember(x => x.PersonName, y => y.MapFrom(z => z.Person != null ? z.Person.FirstName + " " + z.Person.LastName : string.Empty))
                .ForMember(x => x.TicketTypeName, y => y.MapFrom(z => z.Ticket != null ? (z.Ticket.TicketType != null ? z.Ticket.TicketType.Name : string.Empty) : string.Empty))
                .ForMember(x => x.EventName, y => y.MapFrom(z => z.Ticket != null ? (z.Ticket.EventParent != null ? z.Ticket.EventParent.Name : string.Empty) : string.Empty))
                .ForMember(x => x.LocationName, y => y.MapFrom(z => z.Ticket != null ? (z.Ticket.EventParent != null ? (z.Ticket.EventParent.Location != null ? z.Ticket.EventParent.Location.Name : string.Empty) : string.Empty) : string.Empty))
                .ForMember(x => x.DateAndHour, y => y.MapFrom(z => z.Ticket != null ? (z.Ticket.EventParent != null ? (DateTime?)z.Ticket.EventParent.DateAndHour : null) : null));
        }
    }
}
